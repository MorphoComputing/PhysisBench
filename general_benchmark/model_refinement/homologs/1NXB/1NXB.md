# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 7.411 A
- tm_score_ca_ordered: 0.23141592644357872
- heavy_atom_rmsd: 8.155 A
- sidechain_heavy_atom_rmsd: 8.975 A
- **all-atom quality (honest):** heavy 8.155 A, sidechain 8.975 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 590
- bin_accuracy: 0.439

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.410850799360973
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 7.415627722142737  localized_anchor_rmsd: 7.410834460437799

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** W28-R32 → 37 conflicts (82%); N60 → 4 conflicts (9%)
- explained: 41/45 conflicts by 2 root cause(s)
- metrics: hubs=15 (frac 0.25), conflicts/hub=3.0, max_incompat=2.77Å, chain_span=0.967
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): W28-R32 + N60 — explain ~41/45 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C42** — severity 2.98, 7 conflict(s); suspect input ~`W28` (group: push_out)
  - push-out (wants farther): R32@26.2Å(now 23.5,conf 0.71), F31@25.8Å(now 23.0,conf 0.65), G33@22.6Å(now 19.8,conf 0.48), D30@22.0Å(now 19.3,conf 0.46), S56@13.3Å(now 10.4,conf 0.19)
  - D30↔W28: targets 22.0/15.7Å but partners are 4.5Å apart → too_close_together by 1.8Å
  - F31↔W28: targets 25.8/15.7Å but partners are 8.6Å apart → too_close_together by 1.5Å
  - D30↔L51: targets 22.0/8.8Å but partners are 11.2Å apart → too_close_together by 1.9Å
- **C54** — severity 2.87, 5 conflict(s); suspect input ~`W28` (group: push_out)
  - push-out (wants farther): F31@26.7Å(now 24.1,conf 0.78), R32@26.0Å(now 22.7,conf 0.67), D30@24.8Å(now 21.9,conf 0.57), G33@22.2Å(now 18.7,conf 0.47)
  - D30↔W28: targets 24.8/18.3Å but partners are 4.5Å apart → too_close_together by 2.0Å
  - R32↔N60: targets 26.0/7.8Å but partners are 16.4Å apart → too_close_together by 1.7Å
  - D30↔K26: targets 24.8/11.5Å but partners are 11.6Å apart → too_close_together by 1.7Å
- **C2** — severity 2.45, 3 conflict(s); suspect input ~`N60` (group: pull_in)
  - pull-in (wants closer): N60@6.6Å(now 9.2,conf 0.38), T12@9.4Å(now 12.9,conf 0.34)
  - push-out (wants farther): C16@6.6Å(now 3.8,conf 0.38), P18@8.2Å(now 5.5,conf 0.35)
  - R32↔N60: targets 25.6/6.6Å but partners are 16.4Å apart → too_close_together by 2.6Å
  - G33↔N60: targets 22.2/6.6Å but partners are 13.4Å apart → too_close_together by 2.1Å
  - F31↔N60: targets 26.6/6.6Å but partners are 18.3Å apart → too_close_together by 1.7Å
- **C53** — severity 1.99, 4 conflict(s); suspect input ~`W28` (group: push_out)
  - push-out (wants farther): F31@24.4Å(now 21.0,conf 0.54), R32@23.7Å(now 20.2,conf 0.52), D30@21.6Å(now 18.2,conf 0.45), G33@20.2Å(now 16.1,conf 0.41)
  - D30↔W28: targets 21.6/15.0Å but partners are 4.5Å apart → too_close_together by 2.0Å
  - D30↔K26: targets 21.6/8.3Å but partners are 11.6Å apart → too_close_together by 1.8Å
  - D30↔Q27: targets 21.6/11.8Å but partners are 7.9Å apart → too_close_together by 1.9Å
- **C23** — severity 1.97, 4 conflict(s); suspect input ~`N60` (group: push_out)
  - push-out (wants farther): F31@25.8Å(now 23.3,conf 0.65), R32@24.9Å(now 22.4,conf 0.57), S56@7.7Å(now 4.5,conf 0.26)
  - R32↔N60: targets 24.9/6.1Å but partners are 16.4Å apart → too_close_together by 2.5Å
  - F31↔I36: targets 25.8/14.0Å but partners are 9.8Å apart → too_close_together by 2.0Å
  - F31↔E37: targets 25.8/11.4Å but partners are 12.8Å apart → too_close_together by 1.6Å
- **C40** — severity 1.90, 5 conflict(s); suspect input ~`E37` (group: push_out)
  - push-out (wants farther): F31@26.0Å(now 23.1,conf 0.68), R32@25.6Å(now 22.9,conf 0.64), D30@23.5Å(now 20.7,conf 0.51), S56@11.2Å(now 8.3,conf 0.19)
  - F31↔E37: targets 26.0/10.8Å but partners are 12.8Å apart → too_close_together by 2.4Å
  - R32↔I36: targets 25.6/14.3Å but partners are 9.3Å apart → too_close_together by 2.1Å
  - F31↔I36: targets 26.0/14.3Å but partners are 9.8Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=15 · 3-10(G)=6 · coil(C)=3

```
CHEHHHGHEHHHEHHHGHEHHHHCGGGHHEEHEHHHGHEHEHEHHHHHEEECEHHHHHHE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=17 · sheet=23
  - C2 ↔ H6  (helix)
  - H6 ↔ P10  (helix)
  - S8 ↔ T12  (helix)
  - P10 ↔ K14  (helix)
  - Q11 ↔ T15  (helix)
  - T12 ↔ C16  (helix)
  - K14 ↔ P18  (helix)
  - C16 ↔ E20  (helix)
  - P18 ↔ S22  (helix)
  - W28 ↔ R32  (helix)
  - R32 ↔ I36  (helix)
  - T34 ↔ R38  (helix)
  - I36 ↔ C40  (helix)
  - R38 ↔ C42  (helix)
  - C42 ↔ K46  (helix)
  - C54 ↔ V58  (helix)
  - E55 ↔ C59  (helix)
  - F3 ↔ Q9  (sheet)
  - F3 ↔ T13  (sheet)
  - F3 ↔ G19  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=392 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=277 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3268 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=1.444Å max=3.97Å (per-residue in .per_residue.csv)
- most flexible residues: 4, 11, 20, 5, 17

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=0.965Å · max=5.932Å · AlphaFold-PAE analog (low block = rigid unit/domain)
