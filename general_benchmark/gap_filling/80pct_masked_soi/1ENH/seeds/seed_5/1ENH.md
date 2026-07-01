# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_5\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 9.189 A
- tm_score_ca_ordered: 0.16123271945832632
- heavy_atom_rmsd: 10.435 A
- sidechain_heavy_atom_rmsd: 11.252 A
- **all-atom quality (honest):** heavy 10.435 A, sidechain 11.252 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 442
- bin_accuracy: 0.416

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.188582179935107
- ga_delta_rmsd: -1.7317564072881204  ga_fitness_mode: energy
- pre_local_rmsd: 9.257272431528023  localized_anchor_rmsd: 9.188519450277166

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I42-K49 → 167 conflicts (62%); S33-L35 → 28 conflicts (10%); K52 → 17 conflicts (6%)
- explained: 212/267 conflicts by 3 root cause(s)
- metrics: hubs=42 (frac 0.808), conflicts/hub=6.4, max_incompat=12.07Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I42-K49 + S33-L35 + K52 — explain ~212/267 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K52** — severity 70.30, 20 conflict(s); suspect input ~`E34` (group: push_out)
  - pull-in (wants closer): P1@17.0Å(now 23.6,conf 0.94), N48@5.4Å(now 10.3,conf 0.79), S6@18.0Å(now 28.6,conf 0.72), K49@6.0Å(now 11.0,conf 0.72), A4@18.1Å(now 24.9,conf 0.55), R15@16.1Å(now 20.4,conf 0.55)
  - push-out (wants farther): F46@10.6Å(now 7.7,conf 0.79), E34@24.5Å(now 16.7,conf 0.71), S32@22.0Å(now 18.4,conf 0.63), R28@19.8Å(now 14.3,conf 0.57), A40@18.4Å(now 14.8,conf 0.55), K43@14.4Å(now 10.0,conf 0.55)
  - K49↔E34: targets 6.0/24.5Å but partners are 6.4Å apart → too_close_together by 12.1Å
  - N48↔E34: targets 5.4/24.5Å but partners are 7.4Å apart → too_close_together by 11.6Å
  - W45↔E34: targets 10.9/24.5Å but partners are 5.9Å apart → too_close_together by 7.7Å
- **F46** — severity 57.09, 26 conflict(s); suspect input ~`L13` (group: push_out)
  - pull-in (wants closer): L10@11.2Å(now 17.7,conf 0.55), A11@13.2Å(now 20.3,conf 0.55), K14@9.3Å(now 17.8,conf 0.55), L13@8.4Å(now 18.2,conf 0.55)
  - push-out (wants farther): A51@8.6Å(now 5.8,conf 0.79), K52@10.6Å(now 7.7,conf 0.79)
  - K43↔L13: targets 5.1/8.4Å but partners are 21.7Å apart → too_far_apart by 8.1Å
  - R50↔L13: targets 7.0/8.4Å but partners are 22.3Å apart → too_far_apart by 6.9Å
  - K43↔K14: targets 5.1/9.3Å but partners are 21.2Å apart → too_far_apart by 6.8Å
- **S33** — severity 34.99, 15 conflict(s); suspect input ~`K49` (group: pull_in)
  - pull-in (wants closer): A11@16.0Å(now 18.5,conf 0.55)
  - push-out (wants farther): L37@7.0Å(now 3.4,conf 0.99), E39@9.0Å(now 5.6,conf 0.99), A40@13.0Å(now 7.5,conf 0.99), K49@20.4Å(now 7.5,conf 0.59), P1@20.0Å(now 10.1,conf 0.58), A4@16.9Å(now 9.6,conf 0.55), I44@16.4Å(now 7.0,conf 0.55), N38@8.5Å(now 3.4,conf 0.55), K43@13.7Å(now 8.5,conf 0.55)
  - Q30↔K49: targets 5.0/20.4Å but partners are 4.9Å apart → too_close_together by 10.5Å
  - R27↔K49: targets 10.0/20.4Å but partners are 4.4Å apart → too_close_together by 6.1Å
  - Q29↔K49: targets 6.4/20.4Å but partners are 8.2Å apart → too_close_together by 5.8Å
- **L35** — severity 29.90, 19 conflict(s); suspect input ~`E8` (group: pull_in)
  - pull-in (wants closer): L13@9.1Å(now 11.8,conf 0.55), E8@8.9Å(now 12.1,conf 0.55)
  - push-out (wants farther): R50@19.9Å(now 16.5,conf 0.58), P1@18.2Å(now 12.0,conf 0.55), K49@17.6Å(now 9.0,conf 0.55), W45@13.2Å(now 10.5,conf 0.55), A4@12.7Å(now 7.4,conf 0.55)
  - L31↔K49: targets 5.4/17.6Å but partners are 6.8Å apart → too_close_together by 5.4Å
  - I42↔K49: targets 9.1/17.6Å but partners are 3.3Å apart → too_close_together by 5.1Å
  - S32↔K49: targets 5.4/17.6Å but partners are 7.9Å apart → too_close_together by 4.2Å
- **N48** — severity 27.89, 12 conflict(s); suspect input ~`R26` (group: pull_in)
  - pull-in (wants closer): K52@5.4Å(now 10.3,conf 0.79), S7@17.6Å(now 22.0,conf 0.55)
  - push-out (wants farther): Q41@11.0Å(now 7.0,conf 0.99), K43@8.8Å(now 5.2,conf 0.82), I42@10.6Å(now 4.2,conf 0.79), R26@19.5Å(now 9.1,conf 0.57), S32@17.2Å(now 10.4,conf 0.55), T24@16.0Å(now 12.4,conf 0.55)
  - K52↔S7: targets 5.4/17.6Å but partners are 29.5Å apart → too_far_apart by 6.5Å
  - K52↔T3: targets 5.4/13.5Å but partners are 25.1Å apart → too_far_apart by 6.1Å
  - K43↔R26: targets 8.8/19.5Å but partners are 4.9Å apart → too_close_together by 5.8Å
- **K49** — severity 27.77, 12 conflict(s); suspect input ~`S33` (group: pull_in)
  - pull-in (wants closer): K52@6.0Å(now 11.0,conf 0.72), F5@13.8Å(now 17.2,conf 0.55)
  - push-out (wants farther): I42@10.9Å(now 3.3,conf 0.91), K43@9.1Å(now 5.7,conf 0.91), S33@20.4Å(now 7.5,conf 0.59), Q29@18.3Å(now 8.2,conf 0.55), L35@17.6Å(now 9.0,conf 0.55), N38@16.9Å(now 9.8,conf 0.55)
  - W45↔S33: targets 5.4/20.4Å but partners are 5.9Å apart → too_close_together by 9.1Å
  - K52↔F5: targets 6.0/13.8Å but partners are 27.9Å apart → too_far_apart by 8.1Å
  - I44↔S33: targets 7.9/20.4Å but partners are 7.0Å apart → too_close_together by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=14 · 3-10(G)=5 · coil(C)=3

```
EECCEECHHEHHHHEEHHEHHHHGHHGEHHHEHHGGHEEHHHHHHHHEHGHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=19 · sheet=12
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L13 ↔ F17  (helix)
  - F17 ↔ R21  (helix)
  - N18 ↔ Y22  (helix)
  - R21 ↔ E25  (helix)
  - Y22 ↔ R26  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - Q29 ↔ S33  (helix)
  - Q30 ↔ E34  (helix)
  - S33 ↔ L37  (helix)
  - L37 ↔ Q41  (helix)
  - A40 ↔ I44  (helix)
  - Q41 ↔ W45  (helix)
  - I42 ↔ F46  (helix)
  - K43 ↔ Q47  (helix)
  - W45 ↔ K49  (helix)
  - Q47 ↔ A51  (helix)
  - F5 ↔ L10  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=213 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=78 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5139 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
