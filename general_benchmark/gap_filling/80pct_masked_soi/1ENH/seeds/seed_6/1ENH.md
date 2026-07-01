# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_6\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 6.948 A
- tm_score_ca_ordered: 0.21420472366558102
- heavy_atom_rmsd: 8.248 A
- sidechain_heavy_atom_rmsd: 9.157 A
- **all-atom quality (honest):** heavy 8.248 A, sidechain 9.157 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 438
- bin_accuracy: 0.457

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.948418664238614
- ga_delta_rmsd: -1.463128853472564  ga_fitness_mode: energy
- pre_local_rmsd: 6.97904699754909  localized_anchor_rmsd: 6.948376128559668

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I44-K52 → 265 conflicts (81%)
- explained: 265/327 conflicts by 1 root cause(s)
- metrics: hubs=40 (frac 0.769), conflicts/hub=8.2, max_incompat=12.72Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I44-K52 — explain ~265/327 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K52** — severity 104.00, 24 conflict(s); suspect input ~`E34` (group: pull_in)
  - pull-in (wants closer): R15@16.1Å(now 19.9,conf 0.55)
  - push-out (wants farther): F46@10.9Å(now 7.0,conf 0.91), Q47@8.0Å(now 3.8,conf 0.72), E34@24.5Å(now 12.2,conf 0.71), S32@22.0Å(now 9.6,conf 0.63), N38@21.4Å(now 10.9,conf 0.60), R28@19.8Å(now 8.5,conf 0.57), A40@18.4Å(now 7.7,conf 0.55), K43@14.4Å(now 3.2,conf 0.55)
  - N48↔E34: targets 5.4/24.5Å but partners are 6.5Å apart → too_close_together by 12.5Å
  - K49↔E34: targets 5.4/24.5Å but partners are 7.2Å apart → too_close_together by 11.8Å
  - N48↔S32: targets 5.4/22.0Å but partners are 3.9Å apart → too_close_together by 12.7Å
- **E34** — severity 59.54, 17 conflict(s); suspect input ~`K52` (group: push_out)
  - push-out (wants farther): Q41@13.0Å(now 6.9,conf 0.99), L37@8.9Å(now 5.0,conf 0.91), N38@10.6Å(now 7.9,conf 0.79), K52@24.5Å(now 12.2,conf 0.71), I44@17.1Å(now 7.6,conf 0.55), A40@14.2Å(now 11.0,conf 0.55)
  - Q30↔K52: targets 6.0/24.5Å but partners are 6.1Å apart → too_close_together by 12.4Å
  - K52↔R27: targets 24.5/9.8Å but partners are 5.6Å apart → too_close_together by 9.1Å
  - K52↔L31: targets 24.5/5.1Å but partners are 9.8Å apart → too_close_together by 9.5Å
- **S32** — severity 59.31, 21 conflict(s); suspect input ~`K52` (group: pull_in)
  - pull-in (wants closer): E8@13.8Å(now 17.8,conf 0.55)
  - push-out (wants farther): K52@22.0Å(now 9.6,conf 0.63), N48@17.2Å(now 3.9,conf 0.55), I44@12.6Å(now 6.1,conf 0.55), N20@16.0Å(now 12.4,conf 0.55)
  - E39↔K52: targets 6.0/22.0Å but partners are 8.0Å apart → too_close_together by 8.1Å
  - R27↔K52: targets 8.6/22.0Å but partners are 5.6Å apart → too_close_together by 7.8Å
  - Q29↔K52: targets 4.9/22.0Å but partners are 10.0Å apart → too_close_together by 7.1Å
- **N38** — severity 56.21, 24 conflict(s); suspect input ~`K52` (group: pull_in)
  - pull-in (wants closer): R12@14.8Å(now 17.9,conf 0.55), R2@10.2Å(now 13.0,conf 0.55), Q9@12.1Å(now 17.2,conf 0.55)
  - push-out (wants farther): W45@11.0Å(now 7.4,conf 1.00), E34@10.6Å(now 7.9,conf 0.79), K52@21.4Å(now 10.9,conf 0.60), K49@16.9Å(now 9.2,conf 0.55), F46@12.8Å(now 9.0,conf 0.55), Q47@14.7Å(now 9.7,conf 0.55)
  - K43↔K52: targets 9.0/21.4Å but partners are 3.2Å apart → too_close_together by 9.2Å
  - I42↔K52: targets 7.0/21.4Å but partners are 6.2Å apart → too_close_together by 8.2Å
  - Q41↔K52: targets 5.1/21.4Å but partners are 8.2Å apart → too_close_together by 8.0Å
- **L35** — severity 55.70, 21 conflict(s); suspect input ~`R50` (group: pull_in)
  - pull-in (wants closer): E8@8.9Å(now 13.6,conf 0.55)
  - push-out (wants farther): R50@19.9Å(now 12.0,conf 0.58), P1@18.2Å(now 14.0,conf 0.55), K49@17.6Å(now 9.4,conf 0.55), W45@13.2Å(now 7.1,conf 0.55)
  - S32↔R50: targets 5.1/19.9Å but partners are 6.7Å apart → too_close_together by 8.2Å
  - I42↔R50: targets 9.1/19.9Å but partners are 3.2Å apart → too_close_together by 7.7Å
  - S32↔K49: targets 5.1/17.6Å but partners are 5.1Å apart → too_close_together by 7.3Å
- **S33** — severity 40.58, 14 conflict(s); suspect input ~`K49` (group: push_out)
  - push-out (wants farther): L37@7.0Å(now 3.4,conf 1.00), A40@12.0Å(now 8.0,conf 0.72), K49@20.4Å(now 7.5,conf 0.59), P1@20.0Å(now 9.3,conf 0.58), A4@16.9Å(now 11.7,conf 0.55), I44@16.4Å(now 4.8,conf 0.55), K43@13.7Å(now 10.9,conf 0.55)
  - Q30↔K49: targets 5.1/20.4Å but partners are 3.4Å apart → too_close_together by 11.9Å
  - Q29↔K49: targets 6.6/20.4Å but partners are 3.5Å apart → too_close_together by 10.4Å
  - Q30↔I44: targets 5.1/16.4Å but partners are 3.0Å apart → too_close_together by 8.2Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=9 · 3-10(G)=4 · coil(C)=1

```
EEGGECHHHHHHHHEEHHEHHHHHGHHHHEHGHEHHHHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=18 · sheet=1
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - L10 ↔ K14  (helix)
  - K14 ↔ N18  (helix)
  - F17 ↔ R21  (helix)
  - N18 ↔ Y22  (helix)
  - Y22 ↔ R26  (helix)
  - L23 ↔ R27  (helix)
  - R27 ↔ L31  (helix)
  - L31 ↔ L35  (helix)
  - S33 ↔ L37  (helix)
  - L35 ↔ E39  (helix)
  - L37 ↔ Q41  (helix)
  - E39 ↔ K43  (helix)
  - Q41 ↔ W45  (helix)
  - K43 ↔ Q47  (helix)
  - W45 ↔ K49  (helix)
  - Q47 ↔ A51  (helix)
  - E34 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=275 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=140 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.2642 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
