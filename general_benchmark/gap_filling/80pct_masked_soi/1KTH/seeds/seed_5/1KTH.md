# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_5\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 5.127 A
- tm_score_ca_ordered: 0.3737935952166855
- heavy_atom_rmsd: 6.414 A
- sidechain_heavy_atom_rmsd: 7.274 A
- **all-atom quality (honest):** heavy 6.414 A, sidechain 7.274 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 489
- bin_accuracy: 0.607

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.127002683653172
- ga_delta_rmsd: 3.1445243870257897  ga_fitness_mode: energy
- pre_local_rmsd: 5.196994679992253  localized_anchor_rmsd: 5.12703344669368

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C37-E41 → 37 conflicts (74%); A30-R31 → 7 conflicts (14%)
- explained: 44/50 conflicts by 2 root cause(s)
- metrics: hubs=19 (frac 0.339), conflicts/hub=2.6, max_incompat=4.91Å, chain_span=0.804
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C37-E41 + A30-R31 — explain ~44/50 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 15.64, 6 conflict(s); suspect input ~`A30` (group: pull_in)
  - pull-in (wants closer): N40@9.0Å(now 11.9,conf 1.00)
  - push-out (wants farther): R31@17.0Å(now 13.1,conf 1.00), A30@19.0Å(now 16.3,conf 0.99), W33@11.0Å(now 6.0,conf 0.99), F32@14.0Å(now 9.3,conf 0.72)
  - N40↔A30: targets 9.0/19.0Å but partners are 5.5Å apart → too_close_together by 4.5Å
  - N40↔T26: targets 9.0/26.5Å but partners are 12.7Å apart → too_close_together by 4.8Å
  - N40↔K27: targets 9.0/26.0Å but partners are 13.8Å apart → too_close_together by 3.3Å
- **T26** — severity 9.01, 5 conflict(s); suspect input ~`E41` (group: push_out)
  - push-out (wants farther): E41@18.6Å(now 11.6,conf 0.55)
  - A30↔E41: targets 10.6/18.6Å but partners are 3.9Å apart → too_close_together by 4.1Å
  - E41↔C29: targets 18.6/8.1Å but partners are 6.6Å apart → too_close_together by 4.0Å
  - D23↔E41: targets 7.0/18.6Å but partners are 8.1Å apart → too_close_together by 3.5Å
- **G38** — severity 8.52, 4 conflict(s); suspect input ~`S28` (group: push_out)
  - push-out (wants farther): R31@17.0Å(now 10.9,conf 1.00), W33@12.9Å(now 5.1,conf 0.91), F32@14.6Å(now 6.2,conf 0.79), S28@22.7Å(now 19.3,conf 0.70)
  - E41↔S28: targets 10.0/22.7Å but partners are 9.3Å apart → too_close_together by 3.4Å
  - R31↔K43: targets 17.0/11.0Å but partners are 3.7Å apart → too_close_together by 2.3Å
  - R31↔E41: targets 17.0/10.0Å but partners are 4.0Å apart → too_close_together by 3.0Å
- **G36** — severity 7.63, 5 conflict(s); suspect input ~`T26` (group: pull_in)
  - pull-in (wants closer): N40@9.4Å(now 12.4,conf 0.79)
  - push-out (wants farther): R31@15.0Å(now 12.4,conf 1.00), W33@9.0Å(now 5.5,conf 0.99)
  - N40↔T26: targets 9.4/25.3Å but partners are 12.7Å apart → too_close_together by 3.2Å
  - N40↔N25: targets 9.4/24.7Å but partners are 12.4Å apart → too_close_together by 2.8Å
  - A30↔N40: targets 17.0/9.4Å but partners are 5.5Å apart → too_close_together by 2.0Å
- **A30** — severity 5.99, 3 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): C37@19.0Å(now 16.3,conf 0.99), T1@17.4Å(now 13.7,conf 0.55), N42@10.8Å(now 5.2,conf 0.55)
  - C37↔W33: targets 19.0/10.0Å but partners are 6.0Å apart → too_close_together by 3.1Å
  - Y22↔T1: targets 6.4/17.4Å but partners are 7.4Å apart → too_close_together by 3.6Å
  - D23↔T1: targets 8.6/17.4Å but partners are 5.5Å apart → too_close_together by 3.4Å
- **C29** — severity 5.46, 3 conflict(s); suspect input ~`I3` (group: pull_in)
  - pull-in (wants closer): L18@12.7Å(now 17.3,conf 0.55)
  - push-out (wants farther): G39@16.5Å(now 13.3,conf 0.55), I3@13.0Å(now 9.8,conf 0.55)
  - Y22↔I3: targets 4.0/13.0Å but partners are 4.7Å apart → too_close_together by 4.3Å
  - F32↔G39: targets 10.0/16.5Å but partners are 3.5Å apart → too_close_together by 3.0Å
  - D23↔I3: targets 6.6/13.0Å but partners are 3.7Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=25 · 3-10(G)=9 · coil(C)=8

```
EEHHCECCGHEGGECECEEEGGECHEHEHHHHEGHHCCEEEGEEEEEHEHGGHEEE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=3 · sheet=46
  - K27 ↔ R31  (helix)
  - R31 ↔ G35  (helix)
  - F32 ↔ G36  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ W20  (sheet)
  - L6 ↔ G11  (sheet)
  - L6 ↔ K19  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ D23  (sheet)
  - L6 ↔ T26  (sheet)
  - G11 ↔ F16  (sheet)
  - G11 ↔ L18  (sheet)
  - G11 ↔ K19  (sheet)
  - R14 ↔ W33  (sheet)
  - F16 ↔ W33  (sheet)
  - L18 ↔ W33  (sheet)
  - K19 ↔ W33  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - W20 ↔ W33  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=253 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=157 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.167 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
