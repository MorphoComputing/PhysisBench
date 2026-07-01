# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_6\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 2.448 A
- tm_score_ca_ordered: 0.6313037842310155
- heavy_atom_rmsd: 4.193 A
- sidechain_heavy_atom_rmsd: 5.324 A
- **all-atom quality (honest):** heavy 4.193 A, sidechain 5.324 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 484
- bin_accuracy: 0.566

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.4481505962860424
- ga_delta_rmsd: 2.617491733384373  ga_fitness_mode: energy
- pre_local_rmsd: 2.4781870910915273  localized_anchor_rmsd: 2.448107762581886

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A24-F32 → 20 conflicts (87%); A15-R19 → 3 conflicts (13%)
- explained: 23/23 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.25), conflicts/hub=1.6, max_incompat=4.53Å, chain_span=0.536
- **fix-first:** [LOW_CONFLICT] Root cause(s): A24-F32 + A15-R19 — explain ~23/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G27** — severity 11.01, 4 conflict(s); suspect input ~`Q30` (group: push_out)
  - push-out (wants farther): A15@27.4Å(now 23.7,conf 0.94), Y22@8.6Å(now 6.0,conf 0.79), Y20@12.9Å(now 9.8,conf 0.55)
  - A15↔Q30: targets 27.4/9.1Å but partners are 13.7Å apart → too_close_together by 4.5Å
  - A15↔F32: targets 27.4/15.4Å but partners are 8.3Å apart → too_close_together by 3.6Å
  - V33↔A15: targets 19.0/27.4Å but partners are 6.1Å apart → too_close_together by 2.3Å
- **A26** — severity 5.36, 3 conflict(s); suspect input ~`Q30` (group: push_out)
  - push-out (wants farther): I17@22.0Å(now 19.3,conf 0.63), I18@18.9Å(now 16.4,conf 0.56)
  - I18↔Q30: targets 18.9/9.1Å but partners are 5.9Å apart → too_close_together by 4.0Å
  - I17↔Q30: targets 22.0/9.1Å but partners are 9.1Å apart → too_close_together by 3.8Å
  - F32↔I17: targets 15.2/22.0Å but partners are 5.0Å apart → too_close_together by 1.8Å
- **A15** — severity 4.59, 2 conflict(s); suspect input ~`G27` (group: push_out)
  - push-out (wants farther): G27@27.4Å(now 23.7,conf 0.94), K25@27.3Å(now 24.8,conf 0.93)
  - Y20↔G27: targets 15.0/27.4Å but partners are 9.8Å apart → too_close_together by 2.5Å
  - I18↔G27: targets 9.0/27.4Å but partners are 16.0Å apart → too_close_together by 2.4Å
- **L28** — severity 3.31, 2 conflict(s); suspect input ~`K14` (group: push_out)
  - push-out (wants farther): K14@25.6Å(now 22.2,conf 0.70), D2@14.8Å(now 11.6,conf 0.55)
  - F32↔K14: targets 13.4/25.6Å but partners are 9.7Å apart → too_close_together by 2.5Å
  - A24↔D2: targets 7.4/14.8Å but partners are 4.5Å apart → too_close_together by 2.9Å
- **R19** — severity 2.30, 2 conflict(s); suspect input ~`F44` (group: push_out)
  - pull-in (wants closer): F44@5.6Å(now 9.2,conf 0.56), T53@14.3Å(now 17.0,conf 0.55)
  - push-out (wants farther): Q30@8.3Å(now 4.9,conf 0.55)
  - R16↔F44: targets 9.0/5.6Å but partners are 17.1Å apart → too_far_apart by 2.5Å
  - R16↔T53: targets 9.0/14.3Å but partners are 25.0Å apart → too_far_apart by 1.7Å
- **N23** — severity 2.00, 1 conflict(s); suspect input ~`Q30` (group: push_out)
  - push-out (wants farther): R16@21.0Å(now 17.2,conf 0.94)
  - R16↔Q30: targets 21.0/7.4Å but partners are 11.0Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=20 · 3-10(G)=13 · coil(C)=3

```
EEHHCEGEEGGHHHEHGGEGHHEHGGGEGECHHGHHEGEEEGEEHEHEHHEHEHHC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=4 · sheet=34
  - P12 ↔ R16  (helix)
  - F32 ↔ G36  (helix)
  - K45 ↔ D49  (helix)
  - C50 ↔ C54  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ P8  (sheet)
  - D2 ↔ P8  (sheet)
  - E6 ↔ N23  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ N23  (sheet)
  - P8 ↔ L28  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ N23  (sheet)
  - R19 ↔ L28  (sheet)
  - R19 ↔ Q30  (sheet)
  - N23 ↔ L28  (sheet)
  - N23 ↔ Q30  (sheet)
  - N23 ↔ R41  (sheet)
  - N23 ↔ N43  (sheet)
  - L28 ↔ N43  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=212 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1667 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
