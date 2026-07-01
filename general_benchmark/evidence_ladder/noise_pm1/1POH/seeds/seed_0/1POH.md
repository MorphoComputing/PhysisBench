# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.475 A
- tm_score_ca_ordered: 0.9795387898031082
- heavy_atom_rmsd: 2.607 A
- sidechain_heavy_atom_rmsd: 3.467 A
- **all-atom quality (honest):** heavy 2.607 A, sidechain 3.467 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3240
- bin_accuracy: 0.645

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=51
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.7513302720930075 -> 0.6913922306173332 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.47509338525888584
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.490424404694409  localized_anchor_rmsd: 0.4751099546678312

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q2-Q3 → 26 conflicts (32%); A43-S45 → 23 conflicts (28%); T29-S30 → 9 conflicts (11%)
- explained: 58/81 conflicts by 3 root cause(s)
- metrics: hubs=26 (frac 0.313), conflicts/hub=3.1, max_incompat=4.77Å, chain_span=0.964
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q2-Q3 + A43-S45 + T29-S30 — explain ~58/81 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A18** — severity 6.97, 8 conflict(s); suspect input ~`A43` (group: pull_in)
  - pull-in (wants closer): A43@7.0Å(now 10.1,conf 0.37)
  - E31↔A43: targets 18.8/7.0Å but partners are 8.1Å apart → too_close_together by 3.7Å
  - A43↔T33: targets 7.0/15.3Å but partners are 4.9Å apart → too_close_together by 3.4Å
  - I32↔A43: targets 15.2/7.0Å but partners are 5.2Å apart → too_close_together by 3.1Å
- **Q3** — severity 6.86, 8 conflict(s); suspect input ~`V34` (group: pull_in)
  - pull-in (wants closer): V34@7.8Å(now 10.8,conf 0.36)
  - push-out (wants farther): I7@14.9Å(now 12.4,conf 0.34), H75@12.4Å(now 9.9,conf 0.34)
  - A41↔V34: targets 16.2/7.8Å but partners are 5.0Å apart → too_close_together by 3.5Å
  - T51↔V34: targets 21.2/7.8Å but partners are 10.4Å apart → too_close_together by 3.0Å
  - Q50↔V34: targets 21.1/7.8Å but partners are 10.6Å apart → too_close_together by 2.7Å
- **A43** — severity 6.42, 7 conflict(s); suspect input ~`R16` (group: push_out)
  - pull-in (wants closer): A18@7.0Å(now 10.1,conf 0.37)
  - push-out (wants farther): T29@14.5Å(now 11.3,conf 0.34)
  - R16↔A18: targets 16.9/7.0Å but partners are 5.2Å apart → too_close_together by 4.8Å
  - A18↔E65: targets 7.0/11.7Å but partners are 21.8Å apart → too_far_apart by 3.2Å
  - A18↔L13: targets 7.0/14.9Å but partners are 5.7Å apart → too_close_together by 2.3Å
- **V34** — severity 5.17, 6 conflict(s); suspect input ~`Q3` (group: push_out)
  - pull-in (wants closer): Q3@7.8Å(now 10.8,conf 0.36)
  - push-out (wants farther): G53@13.2Å(now 10.4,conf 0.34)
  - K48↔Q3: targets 9.0/7.8Å but partners are 19.8Å apart → too_far_apart by 3.0Å
  - L46↔Q3: targets 9.3/7.8Å but partners are 20.1Å apart → too_far_apart by 3.0Å
  - F47↔Q3: targets 11.8/7.8Å but partners are 22.2Å apart → too_far_apart by 2.7Å
- **I7** — severity 5.15, 7 conflict(s); suspect input ~`L49` (group: pull_in)
  - pull-in (wants closer): L49@11.2Å(now 13.9,conf 0.34)
  - push-out (wants farther): Q3@14.9Å(now 12.4,conf 0.34), Q2@18.2Å(now 15.2,conf 0.37)
  - Q2↔E4: targets 18.2/8.7Å but partners are 6.7Å apart → too_close_together by 2.8Å
  - K48↔L49: targets 17.7/11.2Å but partners are 4.0Å apart → too_close_together by 2.6Å
  - Q3↔E4: targets 14.9/8.7Å but partners are 4.0Å apart → too_close_together by 2.3Å
- **T29** — severity 3.67, 4 conflict(s); suspect input ~`S45` (group: pull_in)
  - pull-in (wants closer): S45@10.4Å(now 13.3,conf 0.34)
  - push-out (wants farther): A43@14.5Å(now 11.3,conf 0.34)
  - Q50↔S45: targets 23.1/10.4Å but partners are 9.0Å apart → too_close_together by 3.7Å
  - L46↔S45: targets 16.7/10.4Å but partners are 3.8Å apart → too_close_together by 2.5Å
  - F47↔S45: targets 18.4/10.4Å but partners are 5.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=21 · 3-10(G)=21 · coil(C)=8

```
CEEGEECCECGGGEHHHHHEHHHHHHGEGEGGEGEEGHEGGCHHEHHHHHHEGHECHEGGECEEGEHGHGHHHHGHHHGHGHC
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=15 · sheet=15
  - T15 ↔ A19  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - A43 ↔ F47  (helix)
  - K44 ↔ K48  (helix)
  - F47 ↔ T51  (helix)
  - Q50 ↔ L54  (helix)
  - E67 ↔ K71  (helix)
  - A72 ↔ L76  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - K78 ↔ E82  (helix)
  - A9 ↔ H14  (sheet)
  - H14 ↔ Q20  (sheet)
  - F28 ↔ T33  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S45  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=330 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1304 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
